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
    public partial class Employee_Info : Form
    {
        const string constr = @"Data Source =DESKTOP-PEGIUMG\YEET;Initial Catalog = test1; Integrated Security = True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        int employee_id;
        public Employee_Info()
        {
            //employee_id = e_id;
            InitializeComponent();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "delete from Employees where employee_id = @employee_id";
            cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@employee_id", employee_id);
            MessageBox.Show("Employee has been succesfully deleted from the database.");
            cm.Dispose();
            con.Close();
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "exec INS_EMP @RepTo, @EmpPos, @EmpSalary, @EmpName, @PhoneNo, @EmpAdd, @Password, @EmpUID, @CNIC";
            cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@RepTo", textBox2.Text);
            cm.Parameters.AddWithValue("@EmpPos", textBox3.Text);
            cm.Parameters.AddWithValue("@EmpSalary", textBox9.Text);
            cm.Parameters.AddWithValue("@EmpName", textBox1.Text);
            cm.Parameters.AddWithValue("@PhoneNo", textBox4.Text);
            cm.Parameters.AddWithValue("@EmpAdd", textBox6.Text);
            cm.Parameters.AddWithValue("@Password", textBox8.Text);
            cm.Parameters.AddWithValue("@EmpUID", textBox7.Text);
            cm.Parameters.AddWithValue("@CNIC", textBox5.Text);

            cm.ExecuteNonQuery();
            con.Close();
            this.Hide();
        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
    }
}
