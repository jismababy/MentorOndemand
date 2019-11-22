using System;
using System.Collections.Generic;

namespace Mentor.Models
{
    public partial class Mentor
    {
        public Mentor()
        {
            MentorSkills = new HashSet<MentorSkills>();
            Trainings = new HashSet<Trainings>();
        }

        public long MtId { get; set; }
        public string MtUsername { get; set; }
        public string MtPassword { get; set; }
        public string MtFirstName { get; set; }
        public string MtLastName { get; set; }
        public long? MtContactNumber { get; set; }
        public string MtLinkedinUrl { get; set; }
        public DateTime? MtRegDatetime { get; set; }
        public long? MtRegCode { get; set; }
        public int? MtYearsOfExperience { get; set; }
        public bool? MtActive { get; set; }

        public ICollection<MentorSkills> MentorSkills { get; set; }
        public ICollection<Trainings> Trainings { get; set; }
    }
}
