using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ChoixResto.Models
{
	public class Utilisateur
	{
		public int Id { get; set; }
		[Display(Name = "Prénom")]
		public string Prenom { get; set; }
		public string Password { get; set; }
		public string Role { get; set; }
	}
}
