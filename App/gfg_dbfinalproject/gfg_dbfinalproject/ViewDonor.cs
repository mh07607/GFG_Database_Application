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
    public partial class ViewDonor : Form
    {
        const string constr = @"Data Source =DESKTOP-PEGIUMG\YEET;Initial Catalog = test1; Integrated Security = True";

        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        public ViewDonor()
        {
            InitializeComponent();
        }

        private void ViewVolunteers_Load(object sender, EventArgs e)
        {
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "select * from Donor where 1=1 ";

            if (textBox7.Text != "")
            {
                sql += @" and Donor_name like '%' + @dname + '%'";
                //cm.Parameters.AddWithValue("@pname", textBox1.Text);
            }

            if (Convert.ToString(comboBox1.SelectedItem) == ">=")
            {
                sql += " and Salary >= @donated";
            }
            if (Convert.ToString(comboBox1.SelectedItem) == "<=")
            {
                sql += " and Salary <= @donated";
            }
            if (Convert.ToString(comboBox1.SelectedItem) == "==")
            {
                sql += " and Salary = @donated";
            }
            if (comboBox5.Text != "")
            {
                sql += " and Position = @dtype";
            }
            

            //string sql = "select COUNT(*) AS 'Total Employees' from Projects P inner join employee_has_project E on P.project_id = E.project_id group by E.project_id";
            cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@dname", textBox7.Text);
            cm.Parameters.AddWithValue("@donated", textBox1.Text);
            cm.Parameters.AddWithValue("@dtype", comboBox5.Text);

            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable d = new DataTable();
            da.Fill(d);
            cm.Dispose();
            con.Close();
            dataGridView1.DataSource = d;
        }

        private void comboBox5_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
