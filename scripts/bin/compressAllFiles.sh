for i in ./*.gba; 
  do zip -r "./output2/$(basename -s .gba ${i} ).zip" "${i}"; 
done