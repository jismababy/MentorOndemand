using Mentor.Controllers;
using Mentor.Models;
using NUnit.Framework;
using System.Collections.Generic;

namespace Tests
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void GetAllSkillsCorrect()
        {
            //var testProducts = GetTestProducts();
            var controller = new UserFuncController();

            var result = controller.Get1() as List<MentorSkills>;
            Assert.AreEqual(8, result.Count);
        }
        [Test]
        public void GetAllSkillsIncorrect()
        {
            //var testProducts = GetTestProducts();
            var controller = new UserFuncController();

            var result = controller.Get1() as List<MentorSkills>;
            Assert.AreEqual(6, result.Count);
        }
    }
}