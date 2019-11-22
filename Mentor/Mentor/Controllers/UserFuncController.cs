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
    public class UserFuncController : ControllerBase
    {
        Mentor_OnDemandContext obj = new Mentor_OnDemandContext();
        // GET: api/UserFunc
        [HttpGet]
        public IEnumerable<MentorList> Get()
        {
            try
            {
                return obj.MentorList.FromSql("get_mentorlist").ToList();
            }
            catch (Exception e)
            {
                return null;
            }
        }

        // POST: api/UserFunc
        //[HttpGet("{mentorid}")]
        //public IEnumerable<AddSkill>Get(long mentorid)
        //{
        //    List<Mentor> men = obj.Mentor.ToList();
        //    List<TechnologySkills> tec = obj.TechnologySkills.ToList();
        //    List<AddSkill> result = new List<AddSkill>();

        //    foreach (Mentor m in men)
        //    {
        //        foreach (TechnologySkills t in tec)
        //        {
        //            if(m.MtId == mentorid && t. && t.MentorId == s.Mtid)
        //        }
        //    }

        //}
        [HttpGet]
        [Route("view")]
        public IEnumerable<MentorSkills> Get1()
        {

            return obj.MentorSkills.ToList();
        }
        [HttpPost]
        public void post( [FromBody] MentorSkills value)
          {
            obj.MentorSkills.Add(value);
            obj.SaveChanges();

          }

        // PUT: api/UserFunc/5
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
