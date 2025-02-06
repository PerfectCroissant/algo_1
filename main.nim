# импортируйте нужные библиотеки (советуем strutils и sequtils)
import strutils, sequtils

proc main() =
  # Реализуйте ваш код здесь
  echo "Введите количество фишек"
  var n = parseInt(stdin.readLine) # Принимаем число и переводим его в int
  echo "Введите числа в количестве $1" % $n
  var numbers: seq[int]
  var flag = true
  var received: seq[string]
  # Пробую себя в действиях с потоком ошибок, что не требовалось заданием, но было интересно сделать
  while flag == true: 
    received = stdin.readLine.split
    if received.len != n: # Проверяем, ввел ли человек обещанное количество чисел
      stderr.writeLine("Введено чисел в количестве $1, необходимо $2. Попробуйте ещё раз" % [$received.len, $n])
    else:
      try:
        numbers = received.map(proc(it: string): int = it.parseInt) # Каждое полученное число переводим в int
        echo "Принято"
        flag = false
      except ValueError: # Ловим ошибку, появляющуюся, если были введены не числа, отчего parseInt не сработает
        raiseAssert("Введены некорректные значения") # Выбрасываем ошибку с соответвующим пояснением, завершаем программу

  echo "Введите загаданное число"
  var k = parseInt(stdin.readLine)
  for i in 0 .. n-2:
    for j in i .. n-1: # Отсчет начинаем c i, чтобы не складывать фишку с самой собой
      if numbers[i] + numbers[j] == k:
        echo "Найдены подходящие фишки: $1 и $2" % [$numbers[i], $numbers[j]]
        flag = true
        break
    if flag == true:
      break
  if flag == false:
    echo "None: Подходящих фишек не найдено"
  
main()
