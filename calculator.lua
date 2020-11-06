--Basic calculator

print("What is the first value?")
first_num = tonumber(io.read())
if first_num == nil then
  print("Please enter valid numbers")
  os.exit()
end
print("What is the second value?")
second_num = tonumber(io.read())
if second_num == nil then
  print("Please enter valid numbers")
  os.exit()
end
print("What is the operand?")
operand = io.read()

if operand~='+' and operand~='-' and operand~='*' and operand~='/' then
  print("Please enter a valid operand (+, -, *, /) ")
  os.exit()
end

if operand == '+' then
  print(first_num + second_num)
elseif operand == '-' then
  print(first_num - second_num)
elseif operand == '*' then
  print(first_num * second_num)
else
  print(first_num/second_num)
end
