require "minitest/autorun"
require "ptab"

=begin
    Example Trial

    "trialNumber": "IPR2016-00831",
    "applicationNumber": "09026118",
    "patentNumber": "6162705",
    "petitionerPartyName": "Commissariat a l’Energie Atomique et aux Energies Alternatives",
    "patentOwnerName": "Silicon Genesis Corporation",
    "inventorName": "FRANCOIS HENLEY",
    "prosecutionStatus": "Terminated-Settled",
    "filingDate": "2016-04-01",
    "accordedFilingDate": "2016-04-01",
    "institutionDecisionDate": "2016-09-28",
    "lastModifiedDatetime": "2017-07-06T16:06:59",
=end

class TestPtabTrial < Minitest::Test
    def setup
        @trial = PtabTrial.objects.get("IPR2016-00831")
    end

    def test_data
        puts(@trial)
        assert_equal "IPR2016-00831", @trial.trial_number
        assert_equal "Silicon Genesis Corporation", @trial.patent_owner_name
    end   
end