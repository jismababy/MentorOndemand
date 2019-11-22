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
    public class UserController : ControllerBase
    {
        Mentor_OnDemandContext obj = new Mentor_OnDemandContext();
         // GET: api/Register
         [HttpGet]
        public IEnumerable<Users> Get()
        {
            return obj.Users.ToList();
        }

        // GET: api/Register/5
        [HttpGet("{usname}/{pass}")]
        public Users Get(string usname, string pass)
        {
            try
            {

                return obj.Users.FromSql("sp_login_user '" + usname + "','" + pass + "'").Single();
            }
            catch (Exception e)
            {
                return null;
            }

        }
        // POST: api/Register
        [HttpPost]
        public void Post([FromBody] Users value)
        {
            obj.Database.ExecuteSqlCommand("sp_reguser '" + value.UsUsername + "','" + value.UsPassword + "','" + value.UsFirstName + "','" + value.UsLastName + "'," + value.UsContactNumber);
        }


       
        // PUT: api/Register/5
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
