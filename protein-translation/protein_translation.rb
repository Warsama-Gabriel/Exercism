class InvalidCodonError < ArgumentError
end

class Translation
  PROTEIN_TRANSLATION = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP',
  }.freeze
  
  def self.of_rna(strand)
    codons = strand.scan(/.{1,3}/)
    codons.take_while do |codon|
      raise InvalidCodonError unless PROTEIN_TRANSLATION.key?(codon)
      PROTEIN_TRANSLATION[codon] != 'STOP'
    end.map { |codon| PROTEIN_TRANSLATION[codon] }
  end
end