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
    public partial class Project_Info : Form
    {
        const string constr = @"Data Source =DESKTOP-PEGIUMG\YEET;Initial Catalog = test1; Integrated Security = True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        int project_id;
        public Project_Info()
        {
            //project_id = p_id;
            InitializeComponent();
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void Project_Info_Load(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "delete from Project where project_id = @project_id";
            cm = new SqlCommand(sql, con);
            //cm.Parameters.AddWithValue("@project_id", project_id);
            MessageBox.Show("Project has been succesfully deleted from the database.");
            cm.Dispose();
            con.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "exec INS_PROJ @ProjectName, @BudgetAllo, @ProjectLeads, @StartDate, @CurrentStat, @Location";
            cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@ProjectName", textBox1.Text);
            cm.Parameters.AddWithValue("@BudgetAllo", textBox2.Text);
            cm.Parameters.AddWithValue("@ProjectLeads", textBox4.Text);
            cm.Parameters.AddWithValue("@StartDate", dateTimePicker1.Value);
            cm.Parameters.AddWithValue("@CurrentStat", "Active");
            cm.Parameters.AddWithValue("@Location", textBox3.Text);

            cm.ExecuteNonQuery();
            con.Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
    }
}
