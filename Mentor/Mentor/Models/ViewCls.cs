using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Mentor.Models
{
    public class ViewCls
    {
        [Key]

        public long? MentorId { get; set; }

        public long UsId { get; set; }
        public string UsFirstName { get; set; }
        public string UsLastName { get; set; }
        public string SkName { get; set; }
        public ViewCls()
        {

        }
        public ViewCls(long MentorId, long Usid, string UsFirstName, string UsLastName,string SkName)
        {
            this.MentorId = MentorId;
            this.UsId = UsId;
            this.UsFirstName = UsFirstName;
            this.UsLastName = UsLastName;
            this.SkName = SkName;

        }
    }
}

