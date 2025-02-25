function blended_sig = wet_dry_function(dry,wet,ratio,Fs)

dry_length = length(dry);
wet_length = length(wet);
length_diff = wet_length-dry_length;

pad = zeros (length_diff,1);
dry = [dry(:); pad];

blended_sig= (1-ratio)*dry + ratio*wet;
sound (blended_sig,Fs)
end 



