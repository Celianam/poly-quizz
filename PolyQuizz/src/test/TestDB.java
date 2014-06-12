package test;
import java.util.List;

import modele.*;

public class TestDB 
{
	public static void main(String[] args)
	{
		//*
		Joueur joueur = new Joueur();
		joueur.setPseudo("celine");
		joueur.setMdp("celine".getBytes());

		if(JoueurRepository.save(joueur))
		{
			System.out.println("joueur sauvegardé");
		}
		else
		{
			System.out.println("error, ce pseudo est déjà pris");
		}
		
		Joueur joueur2 = new Joueur();
		joueur2.setPseudo("stephanie");
		joueur2.setMdp("stephanie".getBytes());
		//joueur2.addToInvitations(joueur);
		if(JoueurRepository.save(joueur2))
		{
			System.out.println("joueur sauvegardé");
		}
		else
		{
			System.out.println("error, ce pseudo est déjà pris");
		}
		
		joueur = new Joueur();
		joueur.setPseudo("francine");
		joueur.setMdp("francine".getBytes());
		if(JoueurRepository.save(joueur))
		{
			System.out.println("joueur sauvegardé");
		}
		else
		{
			System.out.println("error, ce pseudo est déjà pris");
		}
		
		joueur = new Joueur();
		joueur.setPseudo("giovanny");
		joueur.setMdp("giovanny".getBytes());
		if(JoueurRepository.save(joueur))
		{
			System.out.println("joueur sauvegardé");
		}
		else
		{
			System.out.println("error, ce pseudo est déjà pris");
		}
		
		joueur = new Joueur();
		joueur.setPseudo("aurelien");
		joueur.setMdp("aurelien".getBytes());
		if(JoueurRepository.save(joueur))
		{
			System.out.println("joueur sauvegardé");
		}
		else
		{
			System.out.println("error, ce pseudo est déjà pris");
		}
		
		joueur = new Joueur();
		joueur.setPseudo("vaik");
		joueur.setMdp("vaik".getBytes());
		if(JoueurRepository.save(joueur))
		{
			System.out.println("joueur sauvegardé");
		}
		else
		{
			System.out.println("error, ce pseudo est déjà pris");
		}
		/*
		Joueur joueur2 = new Joueur();
		joueur2.setPseudo("lilou4");
		joueur2.setMdp("fifa".getBytes());
		boolean ok2 = JoueurRepository.save(joueur2);
		System.out.println("ok = " + ok + " ok2 = " + ok2);
		//*/
		
		
		List<Joueur> listJoueurs = JoueurRepository.findAll();
		/*
		for(Joueur j : listJoueurs)
		{
			j.setPseudo(j.getPseudo() + "5");
			JoueurRepository.update(j);
		}
		//*/
		
		//Joueur j2 = JoueurRepository.find(10);
		//JoueurRepository.delete(j2);
		
		listJoueurs = JoueurRepository.findAll();
		for(Joueur j : listJoueurs)
		{
			System.out.println(j.getPseudo() + " - " + j.getMdp());
		}
	}
}
