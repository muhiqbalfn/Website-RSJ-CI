<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_menudokter extends CI_Controller {

	function __construct(){
		parent::__construct();
		
	}

	public function index()
	{
		$this->load->view('dokter/index');
	}

	public function antrian() {
		$this->load->view('dokter/antrian');
	}

	public function periksa() {
		$this->load->view('dokter/periksa');
	}

}