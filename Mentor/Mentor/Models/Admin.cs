using System;
using System.Collections.Generic;

namespace Mentor.Models
{
    public partial class Admin
    {
        public long Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
