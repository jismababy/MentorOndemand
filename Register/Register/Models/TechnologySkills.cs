using System;
using System.Collections.Generic;

namespace Register.Models
{
    public partial class TechnologySkills
    {
        public TechnologySkills()
        {
            MentorSkills = new HashSet<MentorSkills>();
            Trainings = new HashSet<Trainings>();
        }

        public long SkId { get; set; }
        public string SkName { get; set; }
        public string SkToc { get; set; }
        public int? SkDuration { get; set; }
        public string SkPrerequites { get; set; }

        public ICollection<MentorSkills> MentorSkills { get; set; }
        public ICollection<Trainings> Trainings { get; set; }
    }
}
