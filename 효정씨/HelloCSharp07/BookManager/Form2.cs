using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BookManager
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
            if(DataManager.books.Count>0)
                bookBindingSource.DataSource = DataManager.books;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            bool existBook = false;
            foreach(var item in DataManager.books)
            {
                // 문자열비고시 equals 대신 == 써도댐
                // JAVA는 버전에 따라서 equals만 써야할수도있고
                // ==도 되는 경우가 있다
                if(item.isbn == textBox1.Text)
                {
                    existBook =true;
                    break;
                }
            }
            if (existBook)
            {
                MessageBox.Show("이미 해당 책 존재합니다.");
            }
            else
            {
                Book book = new Book();
                book.isbn = textBox1.Text;
                book.name = textBox2.Text;
                book.publisher = textBox3.Text;
                int.TryParse(textBox4.Text, out int page);
                if (page <= 0)
                {
                    throw new Exception("Page가 이상해요!");
                    return;
                }
                DataManager.books.Add(book);
                bookBindingSource.DataSource = DataManager.books;
                DataManager.Save();
            }
           
        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            Book b = dataGridView1.CurrentRow.DataBoundItem as Book;
            textBox1.Text = b.isbn;
            textBox2.Text = b.name;
            textBox3.Text = b.publisher;
            textBox4.Text = b.page.ToString();
        }
    }
}
