. ./cmd.sh
. ./path.sh

for vtlnw in 0.8 1.0 1.2; do
    steps/make_mfcc_vtln.sh --cmd "$train_cmd" --vtln true --vtln-warp $vtlnw --tag $vtlnw --nj 70 --mfcc-config conf/mfcc_hires.conf \
            data/train_nodup_sp_vtln_hires exp/make_hires/train_nodup_sp_vtln mfcc_vtln_hires;
done

steps/compute_cmvn_stats.sh data/train_nodup_sp_vtln_hires exp/make_hires/train_nodup_sp_vtln mfcc_vtln_hires;
utils/fix_data_dir.sh data/train_nodup_sp_vtln_hires