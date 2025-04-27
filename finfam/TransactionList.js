// FinFam-Mobile/finfam/TransactionList.js
import React from 'react';
import axios from 'axios';

const TransactionList = ({ transactions, fetchTransactions }) => {
    const handleDelete = async (id) => {
        await axios.delete(`http://localhost:5000/api/transactions/${id}`);
        fetchTransactions(); // Memanggil fungsi untuk memperbarui daftar transaksi
    };

    return (
        <div>
            <h2>Transaction List</h2>
            <ul>
                {transactions.map((transaction) => (
                    <li key={transaction._id}>
                        {transaction.type === 'income' ? 'Income' : 'Expense'}: {transaction.category} - ${transaction.amount}
                        <button onClick={() => handleDelete(transaction._id)}>Delete</button>
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default TransactionList;
