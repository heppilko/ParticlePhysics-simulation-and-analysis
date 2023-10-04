#include <TFile.h>
#include <TTree.h>
#include <TH1F.h>
#include <TLorentzVector.h>
#include <TCanvas.h>

void analysis_root() {

    TFile* file = TFile::Open("../Delphes/delphes_output.root");
    TTree* tree = dynamic_cast<TTree*>(file->Get("Delphes"));
    
    int muon_size;
    float event_weight;
    float muon_pt[8];//this assumes not more than a few muons per event.
    float muon_eta[8];
    float muon_phi[8];
    
    tree->SetBranchAddress("Event.Weight", &event_weight);
    tree->SetBranchAddress("Muon_size", &muon_size);
    tree->SetBranchAddress("Muon.PT", &muon_pt);
    tree->SetBranchAddress("Muon.Eta", &muon_eta);
    tree->SetBranchAddress("Muon.Phi", &muon_phi);
    
    int nEntries = tree->GetEntries();

    // Create a histogram to store dimuon invariant mass
    TH1F* hist_dimuonmass = new TH1F("dimuon_mass", "Dimuon Invariant Mass", 50, 66, 116);

    for (int i = 0; i < nEntries; ++i) {
        tree->GetEntry(i);
        
        //std::cout<<event_weight<<std::endl;
        // Create filters to select the events of interest
        if(muon_size==2){
            TLorentzVector muon1, muon2;
            muon1.SetPtEtaPhiM(muon_pt[0], muon_eta[0], muon_phi[0], 0.10566);
            muon2.SetPtEtaPhiM(muon_pt[1], muon_eta[1], muon_phi[1], 0.10566);
            
            hist_dimuonmass->Fill((muon1+muon2).M());
            
        }
    }
    TCanvas* canvas = new TCanvas("canvas", "Canvas", 800, 600);
    hist_dimuonmass->GetXaxis()->SetTitle("Mass [GeV]");
    hist_dimuonmass->GetYaxis()->SetTitle("Events");
    hist_dimuonmass->Draw();
    canvas->SaveAs("dimuon_mass.png");
}

