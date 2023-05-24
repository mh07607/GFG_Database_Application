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
    public partial class ViewProjects : Form
    {
        const string constr = @"Data Source =DESKTOP-PEGIUMG\YEET;Initial Catalog = test1; Integrated Security = True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        public ViewProjects()
        {
            InitializeComponent();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void ViewProjects_Load(object sender, EventArgs e)
        {
            /*con.open();
            comboBox1.DisplayMember- " category_id"
            combobo
            comboBox1.DataSource-d*/
            

            //   "select COUNT(*) AS 'Total Employees from Projects P inner join employee_has_project E on P.project_id = E.project_id group by E.project_id"
        }

        private void button3_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "select * from Projects where 1=1 ";

            if (textBox1.Text != "")
            {
                sql += @" and Project_Name like '%' + @pname + '%'";
                //cm.Parameters.AddWithValue("@pname", textBox1.Text);
            }

            if (checkBox3.Checked)
            {
                sql += " and Start_Date = @sdate";
            }

            if(textBox5.Text != "")
            {
                sql += @" and location like '%' + @loc + '%'";
            }

            if (checkBox1.Checked)
            {

            }

            if (checkBox3.Checked)
            {

            }

            if(Convert.ToString(comboBox1.SelectedItem) == ">=")
            {
                sql += "select P.Project_Name from Projects P where P.Budget_Allocated >= @budget";
            }
            if (Convert.ToString(comboBox1.SelectedItem) == "<=")
            {
                sql += "select P.Project_Name from Projects P where P.Budget_Allocated <= @budget";
            }
            if (Convert.ToString(comboBox1.SelectedItem) == "==")
            {
                sql += "select P.Project_Name from Projects P where P.Budget_Allocated = @budget";
            }

            //string sql = "select COUNT(*) AS 'Total Employees' from Projects P inner join employee_has_project E on P.project_id = E.project_id group by E.project_id";
            cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@pname", textBox1.Text);
            cm.Parameters.AddWithValue("@date", dateTimePicker1.Value);
            cm.Parameters.AddWithValue("@loc", textBox5.Text);
            if (textBox2.Text != "")
            {
                cm.Parameters.AddWithValue("@budget", (Convert.ToInt32(textBox2.Text)));
            }
            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable d = new DataTable();
            da.Fill(d);
            cm.Dispose();
            con.Close();
            dataGridView1.DataSource = d;
        }

        private void checkBox3_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox3.Checked)
            {
                dateTimePicker1.Enabled = true;
            }
            else
            {
                dateTimePicker1.Enabled = false;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            /*if(checkBox1.Checked == true)
            {
                View_Employees view_emp = new View_Employees();
                    view_emp.Show();

                    if (view_emp.selected_id != -1)
                    {
                        checkBox1.Text = Convert.ToString(view_emp.selected_id);
                    }//Convert.ToString()
                    else
                {
                    checkBox1.Checked = false;
                }

            }
            else
            {
                checkBox1.Text = "Search by Employee(s)";
            }*/
        }
    }
}
