import mysql from "mysql"

export const db = mysql.createConnection({
  host:"localhost",
  user:"u880265500_smartex_db",
  password: "Smartex-react-db123",
  database:"u880265500_smartex"
})