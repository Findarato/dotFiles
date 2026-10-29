/**
 * Token Tracker Plugin - Real-time Display (sidebar_footer slot)
 *
 * Displays live token usage, request count, and cost in the sidebar footer.
 * Updates every 2 seconds during agent execution.
 *
 * Shows two lines:
 *   ⏳ last:  in: 70k · out: 1.2k · 1 req · $0.04
 *   📊 total: in: 1.2m · out: 0.3m · 42 reqs · $1.23
 *
 * Requirements:
 *   - OpenCode v1.4.3+
 *   - tui.json must have: { "plugin": ["./plugins/token-tracker.tsx"] }
 *   - Sidebar must be open (Ctrl+X B) to see the footer
 */

/** @jsxImportSource @opentui/solid */
import type { TuiPlugin, TuiPluginApi, TuiPluginModule } from "@opencode-ai/plugin/tui"
import type { AssistantMessage } from "@opencode-ai/sdk/v2"
import { createMemo, createSignal, onCleanup } from "solid-js"

function TokenFooter(props: { api: TuiPluginApi; session_id: string }) {
  const theme = () => props.api.theme.current

  const [tick, setTick] = createSignal(0)
  const timer = setInterval(() => setTick(t => t + 1), 2000)
  onCleanup(() => clearInterval(timer))

  const tokenData = createMemo(() => {
    tick()

    const state = props.api.state
    const status = state.session.status(props.session_id)
    const isBusy = status?.type === "busy"

    const msgs = state.session.messages(props.session_id)
    const assistantMsgs = msgs.filter((m): m is AssistantMessage =>
      m.role === "assistant" && !!m.tokens
    )

    // Totals across entire session
    const totalInp = assistantMsgs.reduce((sum, m) => sum + (m.tokens.input || 0), 0)
    const totalOut = assistantMsgs.reduce((sum, m) => sum + (m.tokens.output || 0), 0)
    const totalCost = assistantMsgs.reduce((sum, m) => sum + ((m as any).cost || 0), 0)
    const reqCount = assistantMsgs.filter(m => m.tokens.input > 0).length

    // Last request only (last assistant message with input tokens)
    const lastMsg = [...assistantMsgs].reverse().find(m => m.tokens.input > 0)
    const lastInp = lastMsg?.tokens.input || 0
    const lastOut = lastMsg?.tokens.output || 0
    const lastCost = (lastMsg as any)?.cost || 0

    return { totalInp, totalOut, totalCost, reqCount, lastInp, lastOut, lastCost, isBusy }
  })

  const fmt = (n: number) => {
    if (n >= 1_000_000) return `${(n / 1_000_000).toFixed(1)}m`
    if (n >= 1_000) return `${(n / 1_000).toFixed(1)}k`
    return `${n}`
  }

  const fmtCost = (n: number) => {
    if (n >= 1) return `$${n.toFixed(2)}`
    if (n >= 0.01) return `$${n.toFixed(3)}`
    return `$${n.toFixed(4)}`
  }

  return (
    <box>
      <text>
        <span style={{ fg: theme().textMuted }}>
          {tokenData().isBusy ? "⏳ " : "✓  "}
        </span>
        <span style={{ fg: theme().textMuted }}>last:  in: </span>
        <span style={{ fg: theme().text }}>{fmt(tokenData().lastInp)}</span>
        <span style={{ fg: theme().textMuted }}> · out: </span>
        <span style={{ fg: theme().text }}>{fmt(tokenData().lastOut)}</span>
        <span style={{ fg: theme().textMuted }}> · </span>
        <span style={{ fg: theme().text }}>1 req</span>
        {tokenData().lastCost > 0 ? (
          <>
            <span style={{ fg: theme().textMuted }}> · </span>
            <span style={{ fg: theme().accent }}>{fmtCost(tokenData().lastCost)}</span>
          </>
        ) : null}
      </text>
      <text>
        <span style={{ fg: theme().textMuted }}>📊 total: in: </span>
        <span style={{ fg: theme().text }}>{fmt(tokenData().totalInp)}</span>
        <span style={{ fg: theme().textMuted }}> · out: </span>
        <span style={{ fg: theme().text }}>{fmt(tokenData().totalOut)}</span>
        <span style={{ fg: theme().textMuted }}> · </span>
        <span style={{ fg: theme().text }}>{tokenData().reqCount} reqs</span>
        {tokenData().totalCost > 0 ? (
          <>
            <span style={{ fg: theme().textMuted }}> · </span>
            <span style={{ fg: theme().accent }}>{fmtCost(tokenData().totalCost)}</span>
          </>
        ) : null}
      </text>
    </box>
  )
}

const tui: TuiPlugin = async (api) => {
  api.slots.register({
    slots: {
      sidebar_footer(_ctx, props: { session_id: string }) {
        return <TokenFooter api={api} session_id={props.session_id} />
      },
    },
  })
}

export default { id: "token-tracker", tui } satisfies TuiPluginModule
