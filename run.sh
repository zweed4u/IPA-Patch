#Get the IPA
wget https://people.rit.edu/zdw7287/files/Instagram_43.ipa

# Make use of HandyIPAPatcher
cp Instagram_43.ipa HandyIPAPatcher/app.ipa
cd HandyIPAPatcher && ./extract_thin.sh Instagram && cp Instagram_arm* ../hexbytescanner/

#Copy json automation hooking over
cp ../hexbytescanner-hooks/openssl_hook_v2.json ../hexbytescanner/openssl_hook_v2.json

#Build hexbytescanner
cd ../hexbytescanner && ./build.sh && ./hexbytescanner openssl_hook_v2.json Instagram_arm64 && cp Instagram_arm64_patched ../HandyIPAPatcher/Instagram_arm64

#Repack
cd ../HandyIPAPatcher && ./replace_bin.sh Instagram fat trim

echo 'Patched app HandyIPAPatcher/app.ipa can be installed via Cydia Impactor or AppCake'
