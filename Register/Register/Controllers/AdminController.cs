using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Register.Models;

namespace Register.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdminController : ControllerBase
    {

        Mentor_OnDemandContext obj = new Mentor_OnDemandContext();
        // GET: api/Admin
        [HttpGet]
        public IEnumerable<TechnologySkills> Get()
        {
            return obj.TechnologySkills.ToList();
        }

        // GET: api/Admin/5
        
        // POST: api/Admin
        [HttpPost]
        public void Post([FromBody]  TechnologySkills skill)
        {
            try
            {
                obj.TechnologySkills.Add(skill);
                obj.SaveChanges();
            }
            catch(Exception e)
            {
               
            }
        }
        [HttpGet("{usname}/{pass}")]
        public Admin Get(string usname, string pass)
        {
            try
            {

                return obj.Admin.FromSql("sp_login_admin '" + usname + "','" + pass + "'").Single();
            }
            catch (Exception e)
            {
                return null;
            }

        }

        // PUT: api/Admin/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
