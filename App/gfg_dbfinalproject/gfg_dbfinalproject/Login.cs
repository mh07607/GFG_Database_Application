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
    public partial class Login : Form
    {
        const string constr = @"Data Source =DESKTOP-PEGIUMG\YEET;Initial Catalog = test1; Integrated Security = True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        public Login()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "select * from Employees where User_ID = @userid and Password = @password";
            //string sql = "select COUNT(*) AS 'Total Employees' from Projects P inner join employee_has_project E on P.project_id = E.project_id group by E.project_id";
            cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@userid", textBox1.Text);
            cm.Parameters.AddWithValue("@password", textBox2.Text);
            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable d = new DataTable();
            da.Fill(d);
            
            //dataGridView1.DataSource = d;


            if (/*da != null*/ d.Rows.Count != 0) {
                Welcome welcomescr = new Welcome(textBox1.Text);
                this.Hide();
                welcomescr.Show(); }
            else
            {
                MessageBox.Show("Incorrect Username or Password.");
            }

            cm.Dispose();
            con.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //Update_Password resetp = new Update_Password(Convert);
            //this.Hide();
            //resetp.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
