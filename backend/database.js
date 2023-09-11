import mysql from "mysql2"

export const db = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "Rahul@123",
    database: "mydb"
  });
  