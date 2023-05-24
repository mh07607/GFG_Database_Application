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
    public partial class UserProfile : Form
    {
        int userid;
        const string constr = @"Data Source =DESKTOP-PEGIUMG\YEET;Initial Catalog = test1; Integrated Security = True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();

        public UserProfile(int uid)
        {
            InitializeComponent();
            userid = uid;
        }


        private void Form3_Load(object sender, EventArgs e)
        {
            con.Open();
            string sql = "select * from Employees where employee_id = @employee_id";
            cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@employee_id", userid);
            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable d = new DataTable();

            da.Fill(d);

            textBox1.Text = Convert.ToString(d.Rows[0]["Name"]);
            textBox5.Text = Convert.ToString(d.Rows[0]["CNIC"]);
            textBox6.Text = Convert.ToString(d.Rows[0]["Address"]);
            textBox7.Text = Convert.ToString(d.Rows[0]["User_ID"]);
            textBox8.Text = Convert.ToString(d.Rows[0]["Is Founder"]);


            cm.Dispose();
            con.Close();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Update_Password updt_psd = new Update_Password(userid);
            updt_psd.Show();

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }
    }
}
