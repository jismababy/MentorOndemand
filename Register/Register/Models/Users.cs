using System;
using System.Collections.Generic;

namespace Register.Models
{
    public partial class Users
    {
        public Users()
        {
            Trainings = new HashSet<Trainings>();
        }

        public long UsId { get; set; }
        public string UsUsername { get; set; }
        public string UsPassword { get; set; }
        public string UsFirstName { get; set; }
        public string UsLastName { get; set; }
        public long? UsContactNumber { get; set; }
        public DateTime? UsRegDatetime { get; set; }
        public long? UsRegcode { get; set; }
        public bool? UsForceResetPassword { get; set; }
        public bool? UsActive { get; set; }

        public ICollection<Trainings> Trainings { get; set; }
    }
}
