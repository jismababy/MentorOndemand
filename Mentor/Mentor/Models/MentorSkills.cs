using System;
using System.Collections.Generic;

namespace Mentor.Models
{
    public partial class MentorSkills
    {
        public long MsId { get; set; }
        public long? Mid { get; set; }
        public long? Sid { get; set; }
        public int? SelfRating { get; set; }
        public int? YearsOfExp { get; set; }
        public int? TrainingsDelivered { get; set; }
        public string FacilitiesOffered { get; set; }

        public Mentor M { get; set; }
        public TechnologySkills S { get; set; }
    }
}
