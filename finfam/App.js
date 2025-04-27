// FinFam-Mobile/finfam/App.js
import React, { useEffect, useState } from 'react';
import axios from 'axios';
import TransactionForm from './TransactionForm';
import TransactionList from './TransactionList';

const App = () => {
    const [transactions, setTransactions] = useState([]);

    const fetchTransactions = async () => {
        const response = await axios.get('http://localhost:5000/api/transactions');
        setTransactions(response.data);
    };

    useEffect(() => {
        fetchTransactions(); // Memanggil fungsi untuk mengambil transaksi saat komponen pertama kali dimuat
    }, []);

    return (
        <div>
            <h1>FinFam - Pencatatan Transaksi</h1>
            <TransactionForm fetchTransactions={fetchTransactions} />
            <TransactionList transactions={transactions} fetchTransactions={fetchTransactions} />
        </div>
    );
};

export default App;
