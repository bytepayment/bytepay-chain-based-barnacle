FROM rust:latest

RUN apt update
RUN apt install -y git clang curl libssl-dev llvm libudev-dev


RUN rustup default stable
RUN rustup update
RUN rustup update nightly
RUN rustup target add wasm32-unknown-unknown --toolchain nightly

ADD . /app
WORKDIR /app

RUN cargo build --release