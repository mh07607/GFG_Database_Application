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
    public partial class Update_Password : Form
    {
        const string constr = @"Data Source =DESKTOP-PEGIUMG\YEET;Initial Catalog = test1; Integrated Security = True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        int userid;
        public Update_Password(int uid)
        {
            userid = uid;
            InitializeComponent();
        }

        private void Update_Password_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if(textBox1.Text != textBox2.Text)
            {
                MessageBox.Show("Entered and re-entered passwords don't match.");
            }

            con.Open();
            string sql = "select Password from Employees where employee_id = @employee_id";
            cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@employee_id", userid);
            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable d = new DataTable();

            da.Fill(d);

            if(Convert.ToString(d.Rows[0]["Password"]) != textBox1.Text)
            {
                MessageBox.Show("Incorrect Password.");
            }


        }
    }
}
