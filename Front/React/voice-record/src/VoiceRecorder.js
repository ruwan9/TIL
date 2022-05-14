import React, { useState, useRef, useEffect } from "react";
import "./styles.css";
// MUI
import MicIcon from "@mui/icons-material/Mic";
import MicNoneIcon from "@mui/icons-material/MicNone";
import PlayArrowIcon from "@mui/icons-material/PlayArrow";
import StopIcon from "@mui/icons-material/Stop";
import PublishIcon from "@mui/icons-material/Publish";
// Styled
import styled from "styled-components";

export default function VoiceRecoder() {
  const [stream, setStream] = useState({
    access: false,
    recorder: null,
    error: "",
  });

  const [recording, setRecording] = useState({
    active: false,
    available: false,
    url: "",
  });

  const chunks = useRef([]);

  function getAccess() {
    navigator.mediaDevices
      .getUserMedia({ audio: true })
      .then((mic) => {
        let mediaRecorder;

        try {
          mediaRecorder = new MediaRecorder(mic, {
            mimeType: "audio/webm",
          });
        } catch (err) {
          console.log(err);
        }

        const track = mediaRecorder.stream.getTracks()[0];
        track.onended = () => console.log("ended");

        mediaRecorder.onstart = function () {
          setRecording({
            active: true,
            available: false,
            url: "",
          });
        };

        mediaRecorder.ondataavailable = function (e) {
          console.log("data available");
          chunks.current.push(e.data);
        };

        mediaRecorder.onstop = async function () {
          console.log("stopped");

          const url = URL.createObjectURL(chunks.current[0]);
          chunks.current = [];

          setRecording({
            active: false,
            available: true,
            url,
          });
        };

        setStream({
          ...stream,
          access: true,
          recorder: mediaRecorder,
        });
      })
      .catch((error) => {
        console.log(error);
        setStream({ ...stream, error });
      });
  }

  useEffect(() => {
    getAccess();
  }, []);
  //
  const [toggleRecord, setToggleRecord] = useState(true);
  const [disabled, setDisabled] = useState(false);
  const recordOn = () => {
    stream.recorder.start();
    setRecording({ ...recording, active: !recording.active });
    setToggleRecord(!toggleRecord);
  };
  const recordOff = () => {
    stream.recorder.stop();
    setToggleRecord(!toggleRecord);
    setDisabled(true);
  };
  console.log(recording.active);
  return (
    <div className="voice-recoder">
      {stream.access ? (
        <>
          {disabled ? (
            <>
              <audio controls src={recording.url} />
              <PublishIcon />
            </>
          ) : (
            <>
              {toggleRecord ? <MicNoneIcon onClick={recordOn} /> : <MicIcon onClick={recordOff} />}
            </>
          )}
        </>
      ) : (
        // <div className="audio-container">
        //   <button
        //     className={recording.active ? "active" : null}
        //     onClick={() => !recording.active && stream.recorder.start()}
        //   >
        //     Start Recording
        //   </button>
        //   <button onClick={() => stream.recorder.stop()}>Stop Recording</button>
        //   {recording.available && <audio controls src={recording.url} />}
        // </div>
        <button onClick={getAccess}>Get Mic Access</button>
      )}
    </div>
  );
}
