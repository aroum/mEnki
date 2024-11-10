#!/bin/bash

# Переменные для новых размеров
width=3696
height=1931

# Перебор всех PNG-файлов в текущей папке
for img in *.png; do
  # Получение оригинальных размеров изображения
  orig_width=$(identify -format "%w" "$img")
  orig_height=$(identify -format "%h" "$img")
  
  # Вычисление отступов сверху и слева, чтобы захватить правый нижний угол
  offset_x=$((orig_width - width))
  offset_y=$((orig_height - height))

  # Обрезка изображения
  convert "$img" -crop "${width}x${height}+${offset_x}+${offset_y}" +repage "cropped_$img"
done
