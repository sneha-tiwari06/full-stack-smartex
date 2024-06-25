import mysql from "mysql"

export const db = mysql.createConnection({
  host:"localhost",
  user:"ecis_smaruser",
  password: "W]u@,^=7DX^i",
  database:"ecis_smartex"
})