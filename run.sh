#Get the IPA
wget https://people.rit.edu/zdw7287/files/Snapchat_10.29.0.33.ipa

# Make use of HandyIPAPatcher
cp Snapchat_10.29.0.33.ipa HandyIPAPatcher/app.ipa
cd HandyIPAPatcher && ./extract_thin.sh Snapchat && cp Snapchat_arm* ../hexbytescanner/

#Copy json automation hooking over
cp ../hexbytescanner-hooks/openssl_hook_v2.json ../hexbytescanner/openssl_hook_v2.json

#Build hexbytescanner
cd ../hexbytescanner && ./build.sh && ./hexbytescanner openssl_hook_v2.json Snapchat_arm64 && cp Snapchat_arm64_patched ../HandyIPAPatcher/Snapchat_arm64

#Repack
cd ../HandyIPAPatcher && ./replace_bin.sh Snapchat fat trim

echo 'Patched app HandyIPAPatcher/app.ipa can be installed via Cydia Impactor or AppCake'
