#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo "Welcome to My Salon, how can I help you?"

# 显示服务列表
SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
do
  echo "$SERVICE_ID) $SERVICE_NAME"
done

# 获取用户选择的服务 ID
read SERVICE_ID_SELECTED

# 检查服务 ID 是否存在
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
while [[ -z $SERVICE_NAME ]]
do
  echo -e "\nI could not find that service. What would you like today?"
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
done

# 去除服务名称中的首尾空格
SERVICE_NAME=$(echo $SERVICE_NAME | sed 's/^ *//;s/ *$//')

# 获取用户的电话号码
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

# 检查电话号码是否存在
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_ID ]]
then
  # 如果电话号码不存在，获取用户的姓名
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  # 将用户信息插入到 customers 表中
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
else
  # 如果电话号码存在，获取用户的姓名
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
fi

# 去除用户姓名中的首尾空格
CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed 's/^ *//;s/ *$//')

# 获取用户预约的时间
echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

# 将预约信息插入到 appointments 表中
INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

# 输出预约成功的消息
echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."    