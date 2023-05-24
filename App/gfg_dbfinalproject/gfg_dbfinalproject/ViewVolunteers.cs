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
    public partial class ViewVolunteers : Form
    {
        const string constr = @"Data Source =DESKTOP-PEGIUMG\YEET;Initial Catalog = test1; Integrated Security = True";

        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        public ViewVolunteers()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "select * from Volunteer where 1=1 ";

            if (textBox7.Text != "")
            {
                sql += @" and Volunteer_Name like '%' + @vname + '%'";
                //cm.Parameters.AddWithValue("@pname", textBox1.Text);
            }

           


            //string sql = "select COUNT(*) AS 'Total Employees' from Projects P inner join employee_has_project E on P.project_id = E.project_id group by E.project_id";
            cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@vname", textBox7.Text);
       

            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable d = new DataTable();
            da.Fill(d);
            cm.Dispose();
            con.Close();
            dataGridView1.DataSource = d;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int volunteer_id;
            volunteer_id = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["volunteer_id"].Value);
            Volunteer_Info v_info = new Volunteer_Info(volunteer_id);
            v_info.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void ViewVolunteers_Load(object sender, EventArgs e)
        {

        }
    }
}
