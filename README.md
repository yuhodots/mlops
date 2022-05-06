# Machine Learning System Design Patterns

I implemented a simple machine learning system in this repository by referring to [link](https://mercari.github.io/ml-system-design-pattern/).

- Iris flower classification & CIFAR10 classification
- You can check the demo page in [here](#)(TBU).

## Patterns

### Training pattern

- Pipeline training pattern w/ MLflow
- Batch training pattern w/ cron

### Operation pattern

- Model-load pattern w/ GCP Kubernetes Engine & GCP Storage
- Prediction log pattern w/ Fluentd

### Serving pattern

- Web single, Synchronous pattern
  - Web framework: Gunicorn + FastAPI
  - Serving: TensorFlow Serving, ONNX Runtime
  - Database: MySQL, Redis

### QA pattern

- Shadow AB-testing pattern w/ Kubernetes + Istio

## References

- https://github.com/mercari/ml-system-design-pattern
- https://mercari.github.io/ml-system-design-pattern/
- https://github.com/shibuiwilliam/ml-system-in-actions

