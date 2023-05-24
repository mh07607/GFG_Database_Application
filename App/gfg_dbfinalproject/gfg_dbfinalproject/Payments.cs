using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace gfg_dbfinalproject
{
    public partial class Payments : Form
    {
        const string constr = @"Data Source =DESKTOP-PEGIUMG\YEET;Initial Catalog = test1; Integrated Security = True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        public Payments()
        {
            InitializeComponent();

        }

        private void Transactions_Load(object sender, EventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "select * from Funds where 1=1 ";

            if (textBox2.Text != "")
            {
                sql += " and donor_id = @d_id";

            }
            cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@d_id", textBox2.Text);

            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable d = new DataTable();
            da.Fill(d);
            cm.Dispose();
            
            dataGridView1.DataSource = d;

            sql = "select sum(Amount_loss) as [Sum] from Funds where 1=1";


            cm = new SqlCommand(sql, con);
            
            da = new SqlDataAdapter(cm);
            d = new DataTable();
            da.Fill(d);

            textBox4.Text = Convert.ToString(d.Rows[0]["Sum"]);

            con.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
            {
                dateTimePicker1.Enabled = true;
                   
            }
            else
            {
                dateTimePicker1.Enabled = false;
            }
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox2.Checked)
            {
                dateTimePicker2.Enabled = true;

            }
            else
            {
                dateTimePicker2.Enabled = false;
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
