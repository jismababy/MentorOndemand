using System;
using System.Collections.Generic;

namespace Mentor.Models
{
    public partial class Trainings
    {
        public long TrId { get; set; }
        public long? UserId { get; set; }
        public long? MentorId { get; set; }
        public long? SkillId { get; set; }
        public string Status { get; set; }
        public string Progress { get; set; }
        public int? Rating { get; set; }
        public DateTime? StartDate { get; set; }
        public long? AmountReceived { get; set; }

        public Mentor Mentor { get; set; }
        public TechnologySkills Skill { get; set; }
        public Users User { get; set; }
    }
}
