using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Mentor.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Mentor.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NominationController : ControllerBase
    {
        Mentor_OnDemandContext obj = new Mentor_OnDemandContext();
        // GET: api/Nomination
        [HttpGet("{mentorid}")]
        public IEnumerable<ViewCls> Get(long mentorid)
        {
            List<Users> user = obj.Users.ToList();
            List<MentorList> tech = obj.MentorList.FromSql("get_mentorlist").ToList();
            List<Trainings> tra = obj.Trainings.ToList();
            List<ViewCls> result = new List<ViewCls>();

            foreach (Users u in user)
            {
                foreach (Trainings t in tra)
                {

                    foreach (MentorList s in tech)
                    {

                        if (u.UsId == t.UserId && mentorid == t.MentorId && t.MentorId==s.Mtid)
                        {

                            result.Add(new ViewCls(mentorid, u.UsId, u.UsFirstName, u.UsLastName, s.SkName));
                        }
                    }
                }
            
            }
            return result;


        }


        // GET: api/Nomination/5


        // POST: api/Nomination
        [HttpPost("{userid}")]
        public void Post(long userid, [FromBody] MentorList trainings)
        {
            List<Trainings> train = obj.Trainings.ToList();
            Trainings temps = train.Find(x => x.UserId == userid && x.SkillId == trainings.Skid && x.MentorId == trainings.Mtid);
            if (temps == null)
            {
                obj.Database.ExecuteSqlCommand("sp_nominate " + userid + "," + trainings.Mtid + "," + trainings.Skid + "," + trainings.SelfRating + "");
            }

        }

        // PUT: api/Nomination/5
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
