using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Gridview
{
    public class Employee
    {
        public int EmployeeId { get; set; }
        public string EmployeeName { get; set; }
        public string Department { get; set; }
        public string GroupName { get; set; }
        public string JobTitle { get; set; }
    }
    public class EmployeeDataAccessLayer
    {
        private static readonly string Constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        public static List<Employee> GetAllEmployees()
        {
            List<Employee> employees = new List<Employee>();
            using (SqlConnection con = new SqlConnection(Constr))
            {
                SqlCommand cmd = new SqlCommand
                {
                    Connection = con,
                    CommandText = "SELECT * FROM EmployeeDepartmentDetails",
                    CommandType = CommandType.Text
                };
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Employee emp = new Employee();
                    emp.EmployeeId = Convert.ToInt32(reader["EmployeeId"].ToString());
                    emp.EmployeeName = reader["EmployeeName"].ToString();
                    emp.Department = reader["Department"].ToString();
                    emp.GroupName = reader["GroupName"].ToString();
                    emp.JobTitle = reader["JobTitle"].ToString();

                    employees.Add(emp);
                }
                con.Close();
            }
            return employees;
        }

        public static int UpdateEmployee(int Old_EmployeeId, string Old_EmployeeName, string Old_Department, string Old_GroupName,
            string Old_JobTitle, string EmployeeName, string Department, string GroupName, string JobTitle)
        {
            string query = "UPDATE EmployeeDepartmentDetails SET EmployeeName = @EmployeeName, Department = @Department," +
                " GroupName = @GroupName, JobTitle = @JobTitle" +
                " WHERE EmployeeId = @Old_EmployeeId And EmployeeName = @Old_EmployeeName And Department = @Old_Department" +
                " And GroupName = @Old_GroupName And JobTitle = @Old_JobTitle";
            using (SqlConnection con = new SqlConnection(Constr))
            {
                SqlCommand cmd = new SqlCommand
                {
                    Connection = con,
                    CommandText = query,
                    CommandType = CommandType.Text
                };
                cmd.Parameters.AddWithValue("@EmployeeName", EmployeeName);
                cmd.Parameters.AddWithValue("@Department", Department);
                cmd.Parameters.AddWithValue("@GroupName", GroupName);
                cmd.Parameters.AddWithValue("@JobTitle", JobTitle);
                cmd.Parameters.AddWithValue("@Old_EmployeeId", Old_EmployeeId);
                cmd.Parameters.AddWithValue("@Old_EmployeeName", Old_EmployeeName);
                cmd.Parameters.AddWithValue("@Old_Department", Old_Department);
                cmd.Parameters.AddWithValue("@Old_GroupName", Old_GroupName);
                cmd.Parameters.AddWithValue("@Old_JobTitle", Old_JobTitle);
                con.Open();
                return cmd.ExecuteNonQuery();
            }
        }

        public static DataTable GetAllDepartments()
        {
            var DepartmentList = new DataTable();
            string Query = "SELECT Name FROM HumanResources.Department";
            using (SqlConnection con = new SqlConnection(Constr))
            {
                SqlCommand cmd = new SqlCommand
                {
                    Connection = con,
                    CommandText = Query,
                    CommandType = CommandType.Text
                };
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(DepartmentList);
                DataRow dr = DepartmentList.NewRow();
                dr["Name"] = "Select Department";
                DepartmentList.Rows.InsertAt(dr, 0);
                sda.Dispose();
                cmd.Dispose();
                con.Close();
            }
            return DepartmentList;
        }

        public static DataTable GetAllGroupName()
        {
            var GroupNameList = new DataTable();
            using (SqlConnection con = new SqlConnection(Constr))
            {
                SqlCommand cmd = new SqlCommand
                {
                    Connection = con,
                    CommandText = "SELECT DISTINCT GroupName FROM HumanResources.Department",
                    CommandType = CommandType.Text
                };
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(GroupNameList);
                DataRow dr = GroupNameList.NewRow();
                dr["GroupName"] = "Select GroupName";
                GroupNameList.Rows.InsertAt(dr, 0);
                sda.Dispose();
                cmd.Dispose();
                con.Close();
            }
            return GroupNameList;
        }
        public static DataTable GetAllJobTitle()
        {
            var JobTitleList = new DataTable();
            string Query = "SELECT DISTINCT JobTitle FROM HumanResources.vEmployeeDepartment";
            using (SqlConnection con = new SqlConnection(Constr))
            {
                SqlCommand cmd = new SqlCommand
                {
                    Connection = con,
                    CommandText = Query,
                    CommandType = CommandType.Text
                };
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(JobTitleList);
                DataRow dr = JobTitleList.NewRow();
                dr["JobTitle"] = "Select JobTitle";
                JobTitleList.Rows.InsertAt(dr, 0);
                sda.Dispose();
                cmd.Dispose();
                con.Close();
            }
            return JobTitleList;
        }

        public static int DeleteEmployee(int Old_EmployeeId, string Old_EmployeeName, string Old_Department, string Old_GroupName,
            string Old_JobTitle)
        {
            string query = "DELETE FROM EmployeeDepartmentDetails WHERE EmployeeId = @Old_EmployeeId AND EmployeeName = @Old_EmployeeName " +
                "AND Department = @Old_Department AND GroupName = @Old_GroupName AND JobTitle = @Old_JobTitle";
            using (SqlConnection con = new SqlConnection(Constr))
            {
                SqlCommand cmd = new SqlCommand
                {
                    Connection = con,
                    CommandText = query,
                    CommandType = CommandType.Text
                };
                cmd.Parameters.AddWithValue("@Old_EmployeeId", Old_EmployeeId);
                cmd.Parameters.AddWithValue("@Old_EmployeeName", Old_EmployeeName);
                cmd.Parameters.AddWithValue("@Old_Department", Old_Department);
                cmd.Parameters.AddWithValue("@Old_GroupName", Old_GroupName);
                cmd.Parameters.AddWithValue("@Old_JobTitle", Old_JobTitle);
                con.Open();
                return cmd.ExecuteNonQuery();
            }

        }

        public static void InsertEmployee(string EmployeeName, string Department, string GroupName, string JobTitle)
        {
            string Query = "INSERT INTO EmployeeDepartmentDetails (EmployeeName, Department, GroupName, JobTitle) " +
                "VALUES (@EmployeeName, @Department, @GroupName, @JobTitle)";
            using (SqlConnection con = new SqlConnection(Constr))
            {
                SqlCommand cmd = new SqlCommand
                {
                    Connection = con,
                    CommandText = Query,
                    CommandType = CommandType.Text
                };
                cmd.Parameters.AddWithValue("@EmployeeName", EmployeeName);
                cmd.Parameters.AddWithValue("@Department", Department);
                cmd.Parameters.AddWithValue("@GroupName", GroupName);
                cmd.Parameters.AddWithValue("@JobTitle", JobTitle);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
}
