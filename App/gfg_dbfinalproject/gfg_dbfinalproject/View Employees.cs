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
    public partial class View_Employees : Form
    {
        const string constr = @"Data Source =DESKTOP-PEGIUMG\YEET;Initial Catalog = test1; Integrated Security = True";

        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        public int selected_id = -1;
        public bool hasselected;
        public View_Employees(string label = "")
        {
            //label = selected_id;
            InitializeComponent();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {

        }

        private void View_Employees_Load(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "select * from Employees where 1=1 ";

            if (textBox7.Text != "")
            {
                sql += @" and [Name] like '%' + @ename + '%'";
                //cm.Parameters.AddWithValue("@pname", textBox1.Text);
            }

            if (Convert.ToString(comboBox1.SelectedItem) == ">=")
            {
                sql += " and Salary >= @salary";
            }
            if (Convert.ToString(comboBox1.SelectedItem) == "<=")
            {
                sql += " and Salary <= @salary";
            }
            if (Convert.ToString(comboBox1.SelectedItem) == "==")
            {
                sql += " and Salary = @salary";
            }
            if (comboBox5.Text != "")
            {
                sql += " and [Is Founder] = @position";
            }
            if (textBox6.Text != "")
            {
                sql += " and User_ID = @username";
            }

            //string sql = "select COUNT(*) AS 'Total Employees' from Projects P inner join employee_has_project E on P.project_id = E.project_id group by E.project_id";
            cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@ename", textBox7.Text);
            cm.Parameters.AddWithValue("@salary", textBox1.Text);
            cm.Parameters.AddWithValue("@position", comboBox5.Text);
            cm.Parameters.AddWithValue("@username", textBox6.Text);

            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable d = new DataTable();
            da.Fill(d);
            cm.Dispose();
            con.Close();
            dataGridView1.DataSource = d;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            selected_id = Convert.ToInt32(dataGridView1.SelectedCells[0].Value);
        }

        public int theValue()
        {
            return selected_id;
        }

        private void comboBox5_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void groupBox4_Enter(object sender, EventArgs e)
        {

        }
    }
}
