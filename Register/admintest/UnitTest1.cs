using NUnit.Framework;
using Register.Controllers;
using Register.Models;
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
            var controller = new AdminController();

            var result = controller.Get() as List<TechnologySkills>;
            Assert.AreEqual(3, result.Count);
        }
        [Test]
        public void GetAllSkillsIncorrect()
        {
            //var testProducts = GetTestProducts();
            var controller = new AdminController();

            var result = controller.Get() as List<TechnologySkills>;
            Assert.AreEqual(6, result.Count);
        }
    }
}