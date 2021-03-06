describe 'NIB validation' do
  it 'passes for valid NIBs', focus: true do
    nib = '003503730000539151280'

    expect(Citizenship.valid_nib!(nib)).to eq(nib)
    expect(Citizenship.valid_nib?(nib)).to be_truthy
    expect(Citizenship.valid_nib?('0035-03730000539-1512-80')).to be_truthy
    expect(Citizenship.valid_nib?('0035.03730000539.1512.80')).to be_truthy
  end

  it 'fails for invalid NIBs' do
    nib = '003503730000539151200'

    expect{ Citizenship.valid_nib!(nib) }.to raise_error(Citizenship::Error)
    expect{ Citizenship.valid_nib!('000003730000539151252') }.to raise_error(Citizenship::Error) #invalid bank code
    expect(Citizenship.valid_nib?(nib)).to be_falsy
    expect(Citizenship.valid_nib?('')).to be_falsy
  end

  it 'strict validation disallow whitspaces, dashes and dots' do
    expect(Citizenship.valid_nib?('0035-03730000539-1512-80', strict: true)).to be_falsy
    expect(Citizenship.valid_nib?('0035.03730000539.1512.80', strict: true)).to be_falsy
    expect(Citizenship.valid_nib?('0035 03730000539 1512 80', strict: true)).to be_falsy
    expect(Citizenship.valid_nib?('0035 03730000539 1512 80 ', strict: true)).to be_falsy
    expect(Citizenship.valid_nib?('003503730000539151280', strict: true)).to be_truthy
  end
end
