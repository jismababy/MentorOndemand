using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Mentor.Models
{
    public class MentorList
    {
        [Key]

        public long Mtid { get; set; }
        public long Skid { get; set; }
        public string FirstName { get; set; }
        public long Msid { get; set; }
        public string LastName { get; set; }
        public string SkName { get; set; }
        public int SelfRating { get; set; }
        public int Yearsofexperience { get; set; }
    }
}
