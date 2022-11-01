const mysql = require('mysql2/promise');

const pool = mysql.createPool({
    user: 'kwebuser',
    password: 'kwebpw',
    database: 'kweb_db',
});

//const runQuery = async sql => {
//    const conn = await pool.getConnection();
//    try {
//        const [result] = await conn.query(sql);
//        return result;
//    } finally {
//        conn.release();
//    }
//};

const runQuery = async (pstmt, data) => {
    const conn = await pool.getConnection();
    try {
        const sql = conn.format(pstmt, data);
        console.log(`sql:\n${sql}`);
        const [result] = await conn.query(sql);
        return result;
    } finally {
        conn.release();
    }
};

module.exports = { runQuery };
