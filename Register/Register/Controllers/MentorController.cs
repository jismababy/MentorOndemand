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
    public class MentorController : ControllerBase
    {
        Mentor_OnDemandContext obj = new Mentor_OnDemandContext();
        // GET: api/Mentor
        [HttpGet]
        public IEnumerable<Mentor> Get()
        {
            return obj.Mentor.ToList();
        }

        [HttpGet("{usname}/{pass}")]
        public Mentor Get(string usname, string pass)
        {
            try
            {

                return obj.Mentor.FromSql("sp_login_mentor '" + usname + "','" + pass + "'").Single();
            }
            catch (Exception e)
            {
                return null;
            }

        }

        // POST: api/Mentor
        [HttpPost]
        public void Post([FromBody] Mentor value)
        {
            obj.Database.ExecuteSqlCommand("sp_regmentor '" + value.MtUsername+ "','" + value.MtPassword + "','" + value.MtFirstName + "','" + value.MtLastName + "'," + value.MtContactNumber + ",'" + value.MtLinkedinUrl + "',"+value.MtYearsOfExperience );
        }

      
        // PUT: api/Mentor/5
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
