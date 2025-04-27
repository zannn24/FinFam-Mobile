// FinFam-Mobile/finfam/TransactionForm.js
import React, { useState } from 'react';
import axios from 'axios';

const TransactionForm = ({ fetchTransactions }) => {
    const [type, setType] = useState('income');
    const [category, setCategory] = useState('');
    const [amount, setAmount] = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault();
        await axios.post('http://localhost:5000/api/transactions', { type, category, amount });
        fetchTransactions(); // Memanggil fungsi untuk memperbarui daftar transaksi
        setCategory('');
        setAmount('');
    };

    return (
        <form onSubmit={handleSubmit}>
            <select value={type} onChange={(e) => setType(e.target.value)}>
                <option value="income">Income</option>
                <option value="expense">Expense</option>
            </select>
            <input
                type="text"
                placeholder="Category"
                value={category}
                onChange={(e) => setCategory(e.target.value)}
                required
            />
            <input
                type="number"
                placeholder="Amount"
                value={amount}
                onChange={(e) => setAmount(e.target.value)}
                required
            />
            <button type="submit">Add Transaction</button>
        </form>
    );
};

export default TransactionForm;
