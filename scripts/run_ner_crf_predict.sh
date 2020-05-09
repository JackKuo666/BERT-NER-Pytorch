CURRENT_DIR=`pwd`
export BERT_BASE_DIR=$CURRENT_DIR/prev_trained_model/bert-base
export DATA_DIR=$CURRENT_DIR/datasets
export OUTPUR_DIR=$CURRENT_DIR/outputs
TASK_NAME="cner"
export BERT_TRAINED_DIR=$CURRENT_DIR/outputs/${TASK_NAME}_output/bert
#
python run_ner_crf.py \
  --model_type=bert \
  --model_name_or_path=$BERT_TRAINED_DIR \
  --task_name=$TASK_NAME \
  --do_predict \
  --do_lower_case \
  --data_dir=$DATA_DIR/${TASK_NAME}/ \
  --train_max_seq_length=128 \
  --eval_max_seq_length=512 \
  --per_gpu_train_batch_size=24 \
  --per_gpu_eval_batch_size=24 \
  --learning_rate=3e-5 \
  --crf_learning_rate=1e-3 \
  --num_train_epochs=4.0 \
  --logging_steps=448 \
  --save_steps=448 \
  --output_dir=$OUTPUR_DIR/${TASK_NAME}_output/ \
  --overwrite_output_dir \
  --seed=42